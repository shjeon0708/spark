빅데이터처리 Spark 예제

```
sudo apt install git
git clone https://github.com/shjeon0708/spark.git
```

실습에 필요한 이미지 4가지
Apache Spark
Zeppelin-distribution
Zeppelin-server
Zeppelin-interpreter

이미지 용량이 크기때문에 시간이 오래 걸림.
```
eval $(minikube docker-env)

docker pull shjeon0617/spark:3.5.5

docker pull shjeon0617/zeppelin-distribution:latest

docker pull shjeon0617/zeppelin-server:0.11.2

docker pull shjeon0617/zeppelin-interpreter:latest
```

zeppelin 서버 yaml파일 수정
사용되는 docker 이미지 수정 필요함.
위 이미지를 사용했다면 github그대로 사용가능.

```
cp spark/zeppelin/zeppelin-server.yaml zeppelin-0.11.2/k8s/zeppelin-server.yaml

```
zeppelin 서버 실행
```
kubectl apply -f zeppelin-0.11.2/k8s/zeppelin-server.yaml
```

MySQL 실행
```
kubectl apply -f spark/db/mysql.yaml

```

MySQL 실습 테이블 생성
```
kubectl exec -i POD명 -- mysql -u root -pPW  < spark/db/orders.sql
```
