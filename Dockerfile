FROM eclipse-temurin:17-jdk
# jdk 17 도커 이미지 다운로드

# JAR 파일이 저장될 작업 디렉토리
WORKDIR /app

# Maven 또는 Gradle 빌드 후 생성된 JAR 파일을 컨테이너 내부 /app 디렉토리에 app.jar 이름으로 복사
COPY app.jar app.jar 

COPY application-prod.properties /app/application.properties

# 실행 포트 지정
EXPOSE 8081

# 컨테이너 실행 시 JAR 실행 (컨테이너 내부에서 spring이 실행될 것이기 때문)
ENTRYPOINT ["java", "-jar", "app.jar"]