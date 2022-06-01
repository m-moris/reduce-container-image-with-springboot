# Reduce size of  container image with spring boot application

Make your Spring boot application reduce using jdeps and jlink.


#### Docker files

|file | contents | size| ratio|
|--|--|--|--|
| Dockerfile  | Full JDK | 418MB |100%| 
| Dockerfile2 | Custom runtime with jlink | 143MB |34%|
| Dockerfile3 | Custom ruttime with jdeps & jlink (check dependencies dynamically) |143MB|34%|

#### Build images

```sh
docker image rm testapp1 testapp2 testapp3

./mvnw clean package -DskipTests
docker build . -t testapp1 -f ./Dockerfile
docker build . -t testapp2 -f ./Dockerfile2
docker build . -t testapp3 -f ./Dockerfile3
```


#### List images
```sh
> docker image ls "testapp*"
REPOSITORY   TAG       IMAGE ID       CREATED         SIZE
testapp1     latest    f988c6633034   5 minutes ago   418MB
testapp2     latest    e42f7b981fc3   4 minutes ago   143MB
testapp3     latest    e42f7b981fc3   4 minutes ago   143MB
```

#### Run

```sh
docker run -p 8080:8080 testapp3
```

**Result**

```sh
> curl -s http://localhost:8080/  | jq
{
  "date": "2022-06-01T08:38:59.924+00:00",
  "message": "hello spring boot"
}
```
## Reference

* [Container images for the Microsoft Build of OpenJDK | Microsoft Docs](https://docs.microsoft.com/en-us/java/openjdk/containers)
* [The jlink Command](https://docs.oracle.com/en/java/javase/17/docs/specs/man/jlink.html)
* [The jdeps Command](https://docs.oracle.com/en/java/javase/17/docs/specs/man/jdeps.html)