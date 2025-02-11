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
 - Написаны манифесты для создания пространства имен - **namespace.yaml**, запуска "деплоймента" - **deployment.yaml**, сервиса - **service.yaml** и ингресса - **ingress.yaml**
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



</details>

---
