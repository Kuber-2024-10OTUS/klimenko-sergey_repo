# Репозиторий для выполнения домашних заданий курса "Инфраструктурная платформа на основе Kubernetes-2024-10" 

## ДЗ №1:

<details><summary>Инструкция</summary>

### В процессе сделано:
 - Склонирован репозиторий:
    ```bash
    git clone https://github.com/Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir kubernetes-intro
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-intro
    ```
 - Написаны манифесты для создания пространства имен - **namespace.yaml** и запуска "пода" - **pod.yaml**

### Как запустить проект:
 - Выполнить команду создания пространства имен в директории **klimenko-sergey_repo/kubernetes-intro**:
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Выполнить команду запуска "пода":
    ```bash
    kubectl apply -f pod.yaml
    ```

### Как проверить работоспособность:
 - Проверить наличие статуса "Running" "пода", выполнив команду:
    ```bash
    kubectl get pods -n homework
    ```
 - Проверить наличие файла **index.html** в директории пода **/homework**, выполнив команду:
    ```bash
    kubectl exec -ti -n homework init-demo -- bash
    ```
    ```bash
    ls -la /homework
    ```

</details>

---

## ДЗ №2:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir kubernetes-controllers
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-controllers
    ```
 - Написаны манифесты для создания пространства имен - **namespace.yaml** и запуска "деплоймента" - **deployment.yaml**
 - Добавлена метка ноды:
    ```bash
    kubectl label nodes <node_name> homework=true
    ```

## Как запустить проект:
 - Выполнить команду создания пространства имен в директории **klimenko-sergey_repo/kubernetes-controllers**:
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Выполнить команду запуска "деплоймента":
    ```bash
    kubectl apply -f deployment.yaml
    ```

## Как проверить работоспособность:
 - Проверить наличие статуса "Running" "подов", выполнив команду:
    ```bash
    kubectl get pods -n homework
    ```
 - Проверить наличие файла **index.html** в директории одного из "подов" **/homework**, выполнив команду:
    ```bash
    kubectl exec -ti -n homework <pod_name> -- bash
    ```
    ```bash
    ls -la /homework
    ```

</details>

---

## ДЗ №3:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir kubernetes-networks
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-networks
    ```
 - Написаны манифесты для создания пространства имен - **namespace.yaml**, запуска "деплоймента" - **deployment.yaml**,
   сервиса - **service.yaml** и ингресса - **ingress.yaml**
 - Добавлена метка ноды:
    ```bash
    kubectl label nodes <node_name> homework=true
    ```

## Как запустить проект:
 - Выполнить команду создания пространства имен в директории **klimenko-sergey_repo/kubernetes-networks**:
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Выполнить команду запуска "деплоймента":
    ```bash
    kubectl apply -f deployment.yaml
    ```
 - Выполнить команду поднятия сервиса:
    ```bash
    kubectl apply -f service.yaml
    ```
 - Выполнить команду применения ингресс правил:
    ```bash
    kubectl apply -f ingress.yaml
    ```

</details>

---

## ДЗ №4:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir kubernetes-volumes
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-volumes
    ```
 - Написаны манифесты для: создания пространства имен - **namespace.yaml**, запуска "деплоймента" - **deployment.yaml**,
   сервиса - **service.yaml**, ингресса - **ingress.yaml**, объекта типа **configMap** - **cm.yaml**,
   объекта типа **storageClass** - **storageClass.yaml**, запроса хранилища - **pvc.yaml**

## Как запустить проект:
 - Выполнить команду создания пространства имен в директории **klimenko-sergey_repo/kubernetes-volumes**:
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Выполнить команду для создания **storageClass**:
    ```bash
    kubectl apply -f storageClass.yaml
    ```
 - Выполнить команду для запроса хранилища:
    ```bash
    kubectl apply -f pvc.yaml
    ```
 - Выполнить команду запуска "деплоймента":
    ```bash
    kubectl apply -f deployment.yaml
    ```
 - Выполнить команду поднятия сервиса:
    ```bash
    kubectl apply -f service.yaml
    ```
 - Выполнить команду применения ингресс правил:
    ```bash
    kubectl apply -f ingress.yaml
    ```

</details>

---

## ДЗ №5:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir kubernetes-security
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-security
    ```
 - Написаны манифесты для: создания пространства имен - **namespace.yaml**, запуска "деплоймента" - **deployment.yaml**,
   сервиса - **service.yaml**, ингресса - **ingress.yaml**, объекта типа **configMap** - **cm.yaml**,
   объекта типа **storageClass** - **storageClass.yaml**, запроса хранилища - **pvc.yaml**
 - Написаны манифесты для создания сервисного аккаунта *monitoring* - **sa-monitoring.yaml**,
   кластерной роли - **cluster-role.yaml**, кластерной связки - **cluster-role-binding.yaml**
 - Написаны манифесты для создания сервисного аккаунта *cd* - **sa-cd.yaml**,
   роли - **role-cd.yaml**, связки - **role-binding-cd.yaml**
 - Создан **kubeconfig** для сервисного аккаунта *cd*, для этого:
      - Написан манифест **token.yaml** для создания секрета, содержащего токен для сервисного аккаунта
      - Получено значение токена
      - Создан **kubeconfig** для сервисного аккаунта *cd* на основе существующего
 - Произведено перемещение во вновь созданный контекст
 - Сгенерирован для сервисного аккаунта *cd* токен с временем действия 1 день и сохранен в файл **token**

## Как запустить проект:
 - Выполнить команду создания пространства имен в директории **klimenko-sergey_repo/kubernetes-security**:
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Выполнить команду для создания **storageClass**:
    ```bash
    kubectl apply -f storageClass.yaml
    ```
 - Выполнить команду для запроса хранилища:
    ```bash
    kubectl apply -f pvc.yaml
    ```
 - Выполнить команду запуска "деплоймента":
    ```bash
    kubectl apply -f deployment.yaml
    ```
 - Выполнить команду поднятия сервиса:
    ```bash
    kubectl apply -f service.yaml
    ```
 - Выполнить команду применения ингресс правил:
    ```bash
    kubectl apply -f ingress.yaml
    ```
 - Выполнить команду по подготовке к работе сервисного аккаунта *monitoring*:
    ```bash
    for i in sa-monitoring.yaml,cluster-role.yaml,cluster-role-binding.yaml; do kubectl apply -f $i; done
    ```
 - Выполнить команду по подготовке к работе сервисного аккаунта *cd*:
    ```bash
    for i in sa-cd.yaml,role-cd.yaml,role-binding-cd.yaml; do kubectl apply -f $i; done
    ```
 - Выполнить команду для создания секрета, содержащего токен для сервисного аккаунта *cd*:
    ```bash
    kubectl apply -f token.yaml
    ```
 - Получить значение токена, выполнив команду:
    ```bash
    kubectl get secret token-cd -n homework --template={{.data.token}} | base64 --decode
    ```
 - Скопировать существующий **kubeconfig** с последующим редактированием:
    ```bash
    kubectl config view > kubeconfig
    ```
 - Переключиться на вновь созданный контекст:
    ```bash
    kubectl config --kubeconfig=kubeconfig use-context my-context
    ```
 - Выполнить команду для генерации токена для сервисного аккаунта *cd*:
    ```bash
    kubectl --kubeconfig=kubeconfig -n homework create token cd --duration=24h
    ```

</details>

---

## ДЗ №6:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir -p kubernetes-templating/hw6
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-templating/hw6
    ```
 - Создан Helm чарт, именуемый *hw6* и наполнен различными манифестами, заполнены файлы с переменными **Chart.yaml**, **values.yaml**:
    ```bash
    helm create hw6
    ```

## Как запустить проект:
### Задание №1:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с Helm чартом:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-templating/hw6
    ```
 - Добавить чарт для разворачивания СУБД **redis**:
    ```bash
    mkdir charts
    ```
    ```bash
    helm pull oci://registry-1.docker.io/bitnamicharts/redis --untar --untardir ./charts/ --version 20.11.3
    ```
 - Развернуть чарт:
    ```bash
    helm install -n homework -f values.yaml demo-hw6 . --set lifecycle.enabled=false
    ```
 - Получить токен сервисного аккаунта *monitoring*:
    ```bash
    TOKEN=$(kubectl get secret demo-hw6 -n homework --template={{.data.token}} | base64 --decode)
    ```
 - Назначить токен переменной *SA_token* в файле *values.yaml*:
    ```bash
    sed -i "s/^SA_token.*/SA_token: $TOKEN/" values.yaml
    ```
 - Запустить обновление чарта для получения страницы с метриками ноды:
    ```bash
    helm upgrade -n homework -f values.yaml demo-hw6 .
    ```

### Задание №2:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с манифестом *helmfile.yaml*:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-templating
    ```
 - Установить **helmfile**:
     ```bash
    wget https://github.com/helmfile/helmfile/releases/download/v1.0.0-rc.11/helmfile_1.0.0-rc.11_linux_amd64.tar.gz
    ```
    ```bash
    tar -zxvf helmfile_1.0.0-rc.11_linux_amd64.tar.gz
    ```
    ```bash
    sudo mv helmfile /usr/local/bin/
    ```
 - Подготовить к работе **helmfile**, установить необходимые плагины:
    ```bash
    helmfile init
    ```
 - Запустить разворачивание **Kafka**:
    ```bash
    helmfile apply
    ```

</details>

---

## ДЗ №7:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создана директория для ДЗ и произведено перемещение в нее:
    ```bash
    mkdir -p kubernetes-operators
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-operators
    ```
 - Написаны манифесты для: создания пространства имен - **namespace.yaml**, объекта *CustomResourceDefinition* - **CRD.yaml**,
   запуска "деплоймента" оператора - **deployment.yaml**, кастомного ресурса типа *MySQL* - **mysql.yaml**
 - Написаны манифесты для создания сервисного аккаунта *sa-mysql* - **sa-mysql.yaml**,
   кластерной роли - **cluster-role.yaml**, кластерной связки - **cluster-role-binding.yaml**

## Как запустить проект:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с кастомным ресурсом типа *MySQL*:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-operators
    ```
 - Выполнить команду создания пространства имен:
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Создать объект *CustomResourceDefinition*:
    ```bash
    kubectl apply -f CRD.yaml
    ```
 - Выполнить команду по подготовке к работе сервисного аккаунта *sa-mysql*:
    ```bash
    for i in sa-mysql.yaml,cluster-role.yaml,cluster-role-binding.yaml; do kubectl apply -f $i; done
    ```
 - Выполнить команду по созданию оператора:
    ```bash
    kubectl apply -f deployment.yaml
    ```
 - Создать кастомный ресурс типа *MySQL*:
    ```bash
    kubectl apply -f mysql.yaml
    ```

</details>

---

## ДЗ №8:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Собран свой nginx docker образ, именуемый *klsergey/kl-nginx-mon*, из диреткории *klimenko-sergey_repo/kubernetes-monitoring/kl-nginx-mon*:
    ```bash
    docker login -u klsergey docker.io
    ```
    ```bash
    docker build -t kl-nginx-mon:latest .
    ```
    ```bash
    docker tag kl-nginx-mon:latest klsergey/kl-nginx-mon:1.0
    ```
    ```bash
    docker push klsergey/kl-nginx-mon:1.0
    ```
 - Создан Helm чарт, именуемый *hw8* и наполнен различными манифестами, заполнены файлы с переменными **Chart.yaml**, **values.yaml**:
    ```bash
    helm create hw8
    ```

## Как запустить проект:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с Helm чартом:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-monitoring/hw8
    ```
 - Добавить чарт для разворачивания **prometheus**:
    ```bash
    helm pull oci://registry-1.docker.io/bitnamicharts/kube-prometheus --untar --untardir ./charts/ --version 11.1.3
    ```
 - Развернуть чарт:
    ```bash
    helm install -n homework -f values.yaml demo-hw8 .
    ```

## Как проверить работоспособность:
 - Организовать проброс портов:
    ```bash
    kubectl port-forward -n homework StatefulSet/prometheus-demo-hw8-kube-prometheus-prometheus 9090:9090
    ```
 - Открыть второй терминал и в нем запросить метрики по *API*, например:
    ```bash
    curl -s http://localhost:9090/api/v1/query\?query\=\{nginx_connections_accepted\} | jq
    ```

</details>

---

## ДЗ №9:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создан сервисный аккаунт на *Яндекс Облаке*:
    ```bash
    SVC_ACCT="<service_account_name>"
    ```
    ```bash
    FOLDER_ID=$(yc config get folder-id)
    ```
    ```bash
    yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
    ```
 - Выданы права сервисному аккаунту на управление *Managed Service for Kubernetes*:
    ```bash
    ACCT_ID=$(yc iam service-account get $SVC_ACCT | grep ^id | awk '{print $2}')
    ```
    ```bash
    yc resource-manager folder add-access-binding --id $FOLDER_ID --role admin --service-account-id $ACCT_ID
    ```
 - Получен IAM-токен для сервисного аккаунта:
    ```bash
    mkdir ~/keys
    ```
    ```bash
    yc iam key create --service-account-name $SVC_ACCT --output ~/keys/key.json
    ```
 - Подготовлены *Terraform* манифесты для разворачивания *Managed Service for Kubernetes* и объектного хранилища *S3*
 - Добавлен на управляющую машину *Helm* чарт от *Grafana Lab*:
    ```bash
    helm repo add grafana https://grafana.github.io/helm-charts
    ```
    ```bash
    helm repo update
    ```
 - Подготовлены файлы с переменными **values.yaml** для: *Loki*, *promtail*, *Grafana*
 - Развернуто ПО, добавлен в репозиторий скриншот **Screenshot_Grafana.png** с отображением собранных журналов в *Grafana*

 ## Как запустить проект:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с Terraform манифестами:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-logging/terraform
    ```
 - Создать файл **terraform.tfvars** согласно шаблону **terraform.tfvars.example**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
 - Задать в **terraform.tfvars** значения перменным: *cloud_id*, *folder_id*, *public_key*, *service_account_key_file*, *sa_id*
 - Запустить разворачивание *Kubernetes* и S3  хранилища на мощностях Яндекс Облака:
    ```bash
    terraform init
    ```
    ```bash
    terraform apply
    ```
 - Выполнить настройку контекста на управляющей машине:
    ```bash
    yc managed-kubernetes cluster get-credentials hw9-cluster --external
    ```
 - Выпустить ключ доступа секрета клиента *S3*:
    ```bash
    cd ../Loki
    ```
    ```bash
    yc iam access-key create --service-account-name=labsa --format=json > sa-key.json
    ```
 - Добавить значения переменных *secretAccessKey*, *accessKeyId* в файле **values.yaml**
 - Запустить установку **Loki**:
    ```bash
    helm install loki grafana/loki -f values.yaml
    ```
 - Развернуть *promtail*:
    ```bash
    cd ../promtail
    ```
    ```bash
    helm install promtail grafana/promtail -f values.yaml
    ```
 - Развернуть *Grafana*:
    ```bash
    cd ../Grafana
    ```
    ```bash
    helm install my-grafana grafana/grafana -f values.yaml
    ```

## Как проверить работоспособность:
 - Организовать проброс портов для доступа к *Grafana* с локальной машины:
    ```bash
    export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=my-grafana" -o jsonpath="{.items[0].metadata.name}")
    ```
    ```bash
    kubectl get secret --namespace default my-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
    ```
    ```bash
    kubectl --namespace default port-forward $POD_NAME 3000
    ```
 - На локальной машине в браузере открыть *Grafana* по адресу:
    ```http
    http://localhost:3000
    ```
 - В разделе *Data source* добавить *Loki* по адресу:
    ```http
    http://loki-gateway.default.svc.cluster.local/
    ```
 - Перейти в раздел *Drilldown*, убедиться в наличии журналов

</details>

---

## ДЗ №10:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создан сервисный аккаунт на *Яндекс Облаке*:
    ```bash
    SVC_ACCT="<service_account_name>"
    ```
    ```bash
    FOLDER_ID=$(yc config get folder-id)
    ```
    ```bash
    yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
    ```
 - Выданы права сервисному аккаунту на управление *Managed Service for Kubernetes*:
    ```bash
    ACCT_ID=$(yc iam service-account get $SVC_ACCT | grep ^id | awk '{print $2}')
    ```
    ```bash
    yc resource-manager folder add-access-binding --id $FOLDER_ID --role admin --service-account-id $ACCT_ID
    ```
 - Получен IAM-токен для сервисного аккаунта:
    ```bash
    mkdir ~/keys
    ```
    ```bash
    yc iam key create --service-account-name $SVC_ACCT --output ~/keys/key.json
    ```
 - Подготовлены *Terraform* манифесты для разворачивания *Managed Service for Kubernetes*
  - Написан манифест для разворачивания проекта в *ArgoCD*, именуемый *project-otus.yaml*
  - Написаны манифесты для разворачивания приложений посредством *ArgoCD*, именуемые *app-argocd-01.yaml*, *app-argocd-02.yaml*

 ## Как запустить проект:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с Terraform манифестами:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-gitops/terraform
    ```
 - Создать файл **terraform.tfvars** согласно шаблону **terraform.tfvars.example**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
 - Задать в **terraform.tfvars** значения перменным: *cloud_id*, *folder_id*, *public_key*, *service_account_key_file*, *sa_id*
 - Запустить разворачивание *Kubernetes* на мощностях Яндекс Облака:
    ```bash
    terraform init
    ```
    ```bash
    terraform apply
    ```
 - Выполнить настройку контекста на управляющей машине:
    ```bash
    yc managed-kubernetes cluster get-credentials hw10-cluster --external
    ```
 - Скачать *Helm* репозиторий с *ArgoCD*:
    ```bash
    cd ..
    ```
    ```bash
    helm pull oci://cr.yandex/yc-marketplace/yandex-cloud/argo/chart/argo-cd --version 7.3.11-2 --untar
    ```
 - Скопировать файл с перменными **values.yaml** в директорию с *Helm* репозиторием:
    ```bash
    cp ArgoCD/values.yaml argo-cd/values.yaml
    ```
 - Развернуть *ArgoCD* в кластере:
    ```bash
    cd argo-cd
    ```
    ```bash
    helm install --namespace argocd --create-namespace argo-cd .
    ```
 - Получить пароль от учетной записи *admin* в *ArgoCD*:
    ```bash
    kubectl --namespace argocd get secret argocd-initial-admin-secret --output jsonpath="{.data.password}" | base64 -d
    ```
 - Развернуть в кластере приложения посредством *ArgoCD*:
    ```bash
    cd ..
    ```
    ```bash
    kubectl apply -f project-otus.yaml
    ```
    ```bash
    kubectl apply -f app-argocd-01.yaml -f app-argocd-02.yaml
    ```

## Как проверить работоспособность:
 - Проверить наличие "подов" в состоянии *Running*:
    ```bash
    kubectl get pods -n homework
    ```
    ```bash
    kubectl get pods -n homeworkhelm
    ```
 - Организовать проброс портов для доступа к *ArgoCD* с локальной машины:
    ```bash
    kubectl port-forward service/argo-cd-argocd-server --namespace argocd 8080:443
    ```
 - На локальной машине в браузере открыть *ArgoCD* по адресу:
    ```http
    https://localhost:8080
    ```
 - В разделе *Applications* проверить, что статус приложений *Healthy*

</details>

---

## ДЗ №11:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создан сервисный аккаунт на *Яндекс Облаке*:
    ```bash
    SVC_ACCT="<service_account_name>"
    ```
    ```bash
    FOLDER_ID=$(yc config get folder-id)
    ```
    ```bash
    yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
    ```
 - Выданы права сервисному аккаунту на управление *Managed Service for Kubernetes*:
    ```bash
    ACCT_ID=$(yc iam service-account get $SVC_ACCT | grep ^id | awk '{print $2}')
    ```
    ```bash
    yc resource-manager folder add-access-binding --id $FOLDER_ID --role admin --service-account-id $ACCT_ID
    ```
 - Получен IAM-токен для сервисного аккаунта:
    ```bash
    mkdir ~/keys
    ```
    ```bash
    yc iam key create --service-account-name $SVC_ACCT --output ~/keys/key.json
    ```
 - Подготовлены *Terraform* манифесты для разворачивания *Managed Service for Kubernetes*
 - Подготовлены файлы с переменными **values.yaml** для: *consul*, *vault*
 - Написаны манифесты **sa-vault-auth.yaml**, **cluster-role-binding.yaml** для создания сервисного аккаунта *vault-auth* и *ClusterRoleBinding*
 - Написана политика в файле **otus-policy.hcl**
 - Написаны манифесты **SecretStore.yaml**, **ExternalSecret.yaml** для создания сущности типа *Secret*, именуемый *otus-cred*

 ## Как запустить проект:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с Terraform манифестами:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-vault/terraform
    ```
 - Создать файл **terraform.tfvars** согласно шаблону **terraform.tfvars.example**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
 - Задать в **terraform.tfvars** значения перменным: *cloud_id*, *folder_id*, *public_key*, *service_account_key_file*, *sa_id*
 - Запустить разворачивание *Kubernetes* на мощностях Яндекс Облака:
    ```bash
    terraform init
    ```
    ```bash
    terraform apply
    ```
 - Выполнить настройку контекста на управляющей машине:
    ```bash
    yc managed-kubernetes cluster get-credentials hw11-cluster --external
    ```
 - Скачать репозиторий *consul* и установить его:
    ```bash
    cd ..
    ```
    ```bash
    git clone https://github.com/hashicorp/consul-k8s.git
    ```
    ```bash
    helm install consul -f consul/values.yaml ./consul-k8s/charts/consul/ -n consul --create-namespace
    ```
 - Скачать репозиторий *vault* и установить его:
    ```bash
    git clone https://github.com/hashicorp/vault-helm.git
    ```
    ```bash
    helm install vault -f vault/values.yaml ./vault-helm -n vault --create-namespace
    ```
 - Выполнить инициализацию *vault*:
    ```bash
    kubectl exec -ti -n vault vault-0 -- sh
    ```
    ```bash
    vault operator init -key-shares=1 -key-threshold=1
    ```
    ```bash
    exit
    ```
 - Распечатать с помощью полученных unseal key все поды хранилища следующей командой:
    ```bash
    kubectl exec -ti -n vault <vault-X> -- sh
    ```
    ```bash
    vault operator unseal <key-shares>
    ```
    ```bash
    exit
    ```
 - Организовать проброс портов для доступа к WebUI *vault* с локальной машины:
    ```bash
    kubectl port-forward service/vault --namespace vault 8200:8200
    ```
 - На локальной машине в браузере открыть *vault* по адресу:
    ```http
    https://localhost:8200
    ```
 - Создать хранилище секретов *otus/* с *Secret Engine KV*, а в нем секрет *otus/cred*, содержащий *username='otus'* *password='asajkjkahs’*
 - Создать сервисный аккаунт *vault-auth* с ролью *system:auth-delegator*:
    ```bash
    kubectl apply -f sa-vault-auth.yaml
    ```
    ```bash
    kubectl apply -f cluster-role-binding.yaml
    ```
 - Сохранить в переменной токен сервисного аккаунта:
    ```bash
    SA_TOKEN=$(kubectl get secret/vault-auth-secret -n vault -o json | jq -r .data.token | base64 -d)
    ```
 - Включить авторизацию *auth/kubernetes* и сконфигурировать ее:
    ```bash
    kubectl -n vault exec vault-0 -- sh -c 'vault login <ROOT_TOKEN>'
    ```
    ```bash
    kubectl -n vault exec vault-0 -- sh -c 'vault auth enable kubernetes'
    ```
    ```bash
    KUBERNETES_PORT_443_TCP_ADDR=$(echo $(kubectl -n vault exec vault-0 -- sh -c 'echo ${KUBERNETES_PORT_443_TCP_ADDR}'))
    ```
    ```bash
    kubectl -n vault exec vault-0 -- sh -c "vault write auth/kubernetes/config\
    token_reviewer_jwt=${SA_TOKEN} \
    kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
    kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"
    ```
 - Применена политика *otus-policy*:
    ```bash
    OTUS_POLICY=$(cat otus-policy.hcl)
    ```
    ```bash
    kubectl -n vault exec vault-0 -- sh -c "echo '$OTUS_POLICY' > /tmp/otus-policy.hcl"
    ```
    ```bash
    kubectl -n vault exec vault-0 -- sh -c "vault policy write otus-policy /tmp/otus-policy.hcl"
    ```
 - Создать роль *auth/kubernetes/role/otus*:
    ```bash
    kubectl -n vault exec vault-0 -- sh -c 'vault write auth/kubernetes/role/otus \
    bound_service_account_names=vault-auth \
    bound_service_account_namespaces=vault \
    policies=otus-policy \
    ttl=1h'
    ```
 - Установить *External Secrets Operator*:
    ```bash
    helm repo add external-secrets https://charts.external-secrets.io
    ```
    ```bash
    helm repo update
    ```
    ```bash
    helm install external-secrets external-secrets/external-secrets -n vault
    ```
 - Создать сущность типа *Secret* посредством *External Secrets Operator*:
    ```bash
    kubectl apply -f SecretStore.yaml
    ```
    ```bash
    kubectl apply -f ExternalSecret.yaml
    ```

## Как проверить работоспособность:
 - Получить значения из сущности типа *Secret*, именуемой *otus-cred*:
    ```bash
    kubectl get Secret -n vault otus-cred -o json | jq .data
    ```
    ```bash
    kubectl get Secret -n vault otus-cred -o json | jq -r .data.username | base64 -d
    ```
    ```bash
    kubectl get Secret -n vault otus-cred -o json | jq -r .data.password | base64 -d
    ```

</details>

---

## ДЗ №12:

<details><summary>Инструкция</summary>

## В процессе сделано:
 - Создан сервисный аккаунт на *Яндекс Облаке*:
    ```bash
    SVC_ACCT="<service_account_name>"
    ```
    ```bash
    FOLDER_ID=$(yc config get folder-id)
    ```
    ```bash
    yc iam service-account create --name $SVC_ACCT --folder-id $FOLDER_ID
    ```
 - Выданы права сервисному аккаунту на управление *Managed Service for Kubernetes*:
    ```bash
    ACCT_ID=$(yc iam service-account get $SVC_ACCT | grep ^id | awk '{print $2}')
    ```
    ```bash
    yc resource-manager folder add-access-binding --id $FOLDER_ID --role admin --service-account-id $ACCT_ID
    ```
 - Получен IAM-токен для сервисного аккаунта:
    ```bash
    mkdir ~/keys
    ```
    ```bash
    yc iam key create --service-account-name $SVC_ACCT --output ~/keys/key.json
    ```
 - Подготовлены *Terraform* манифесты для разворачивания *Managed Service for Kubernetes*, объектного хранилища *S3*, создания сервисной учетной записи *sa-s3* для доступа к хранилищу
 - Написаны манифесты: *namespace.yaml*, *secret.yaml*, *storageClass.yaml*, *pvc.yaml*, *deployment.yaml*

## Как запустить проект:
 - Склонировать репозиторий в локальное расположение, перейти в директорию с Terraform манифестами:
    ```bash
    git clone git@github.com:Kuber-2024-10OTUS/klimenko-sergey_repo.git
    ```
    ```bash
    cd klimenko-sergey_repo/kubernetes-csi/terraform
    ```
 - Создать файл **terraform.tfvars** согласно шаблону **terraform.tfvars.example**:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
 - Задать в **terraform.tfvars** значения перменным: *cloud_id*, *folder_id*, *public_key*, *service_account_key_file*, *sa_id*
 - Запустить разворачивание *Kubernetes* на мощностях Яндекс Облака:
    ```bash
    terraform init
    ```
    ```bash
    terraform apply
    ```
 - Выполнить настройку контекста на управляющей машине:
    ```bash
    yc managed-kubernetes cluster get-credentials hw12-cluster --external
    ```
 - Выполнить команду создания пространства имен:
    ```bash
    cd ..
    ```
    ```bash
    kubectl apply -f namespace.yaml
    ```
 - Выпустить ключ доступа секрета клиента *S3*:
    ```bash
    yc iam access-key create --service-account-name=sa-s3 --format=json > sa-key.json
    ```
 - В манифесте *secret.yaml* заполнить ключи **accessKeyID**, **secretAccessKey**, затем развернуть его:
    ```bash
    kubectl apply -f secret.yaml
    ```
 - Установить *StorageClass*, описывающий *S3* тип хранилища:
    ```bash
    kubectl apply -f storageClass.yaml
    ```
 - Установить *CSI S3* драйвер:
    ```bash
    git clone https://github.com/yandex-cloud/k8s-csi-s3.git
    ```
    ```bash
    kubectl apply -f k8s-csi-s3/deploy/kubernetes/provisioner.yaml
    ```
    ```bash
    kubectl apply -f k8s-csi-s3/deploy/kubernetes/driver.yaml
    ```
    ```bash
    kubectl apply -f k8s-csi-s3/deploy/kubernetes/csi-s3.yaml
    ```
 - Развернуть *PersistentVolumeClaim*, использующий для хранения *S3 storageClass*:
    ```bash
    kubectl apply -f pvc.yaml
    ```
 - Развернуть *Deployment*, использующий созданный *PVC*:
    ```bash
    kubectl apply -f deployment.yaml
    ```

## Как проверить работоспособность:
 - Убедиться в наличии **index.html** файла, сохраненного "подом" в *S3* хранилище, открыв в браузере ссылку:
    ```bash
    S3_VOLUMENAME=$(kubectl get pvc -n homework hw12-pvc -o json | jq -r .spec.volumeName)
    ```
    ```curl
    https://console.yandex.cloud/folders/${FOLDER_ID}/storage/buckets/hw12-bucket?key=${S3_VOLUMENAME}%2F
    ```

</details>

---

## ДЗ №13:

<details><summary>Инструкция</summary>


</details>

---