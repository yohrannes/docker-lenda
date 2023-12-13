import requests
import subprocess


username = "yohrannes" # substitua pelo nome de usuário do GitHub
repo_name = "docker-lenda" # substitua pelo nome do repositório

url = f"https://api.github.com/repos/{username}/{repo_name}/commits"
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    latest_commit_sha = data[0]['sha']
    actual_commit_sha = f"{latest_commit_sha}"
    # latest_commit_sha = "teste"
    print(f"{actual_commit_sha}")
    print(f"{latest_commit_sha}")
else:
    print(f"{response.status_code}")
    
if actual_commit_sha != latest_commit_sha:
    print ("commit atualizado")
else:
    print ("commit em dia")