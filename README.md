# sinatra-example


## Setup tools

```bash
# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
echo '. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
source ~/.bash_profile

# Import asdf plugins
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add minikube https://github.com/alvarobp/asdf-minikube.git
asdf plugin-add kubectl https://github.com/Banno/asdf-kubectl.git
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf plugin-add helmfile https://github.com/feniix/asdf-helmfile.git

# Import the Node.js release team's OpenPGP keys to main keyring:
bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

# Install tools
git clone git@github.com:awaythrow/sinatra-example
cd sinatra-example
asdf install
```

```bash
docker run -p 127.0.0.1:5432:5432/tcp --name postgres -e POSTGRES_PASSWORD=$DATABASE_PASS -d postgres 
```

```
rake db:create_migration NAME=create_users
```

## Setup minikube

```bash
minikube start
minikube addons enable ingress
```


## Bootstrap flux

```bash
cd deploy/helmfile
helmfile sync
```

```bash
kubectl create configmap -n demo sinatra-example --dry-run -o yaml
kubectl create secret generic -n demo sinatra-example --dry-run -o yaml
```