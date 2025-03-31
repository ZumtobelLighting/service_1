import yaml
import argparse
import subprocess

def load_values(file_path):
    with open(file_path, 'r') as f:
        return yaml.safe_load(f)

def save_values(file_path, data):
    with open(file_path, 'w') as f:
        yaml.dump(data, f, default_flow_style=False)

def bump_version(version):
    major, minor, patch = map(int, version.split('.'))
    return f"{major}.{minor}.{patch + 1}"

def update_versions(file_path, service=None):
    values = load_values(file_path)
    
    # Atualiza versão do produto
    values['productVersion'] += 1
    
    if service:
        if service in values['services']:
            values['services'][service]['image'] = values['services'][service]['image'].split(':')[0] + f":{bump_version(values['services'][service]['image'].split(':')[1])}"
        else:
            print(f"Serviço {service} não encontrado.")
            return
    else:
        for svc in values['services']:
            values['services'][svc]['image'] = values['services'][svc]['image'].split(':')[0] + f":{bump_version(values['services'][svc]['image'].split(':')[1])}"
    
    save_values(file_path, values)
    
    # Commit e push automático
    subprocess.run(["git", "add", file_path])
    subprocess.run(["git", "commit", "-m", "Bump version"])
    subprocess.run(["git", "push"])
    print("Versões atualizadas e commit feito com sucesso.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Bump de versão dos microservices")
    parser.add_argument("--service", type=str, help="Nome do serviço a atualizar (opcional)")
    args = parser.parse_args()
    
    update_versions("../charts/product/values.yaml", args.service)