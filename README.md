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
    helm create hw6
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



</details>

---
