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

## ДЗ №1:

<details><summary>Инструкция</summary>


</details>

---
