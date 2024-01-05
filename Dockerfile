# JDK 17과 Tomcat을 사용하는 Dockerfile
FROM tomcat:9-jdk17-openjdk

# 애플리케이션 디렉토리 생성
WORKDIR /app

# 소스 코드 및 빌드 파일 복사
COPY . /app

# Spring Boot 애플리케이션 빌드
RUN ./gradlew build -x test

# 빌드된 JAR 파일을 애플리케이션 디렉토리로 복사
COPY build/libs/*.jar app.jar

# 한국 시간대 설정
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Tomcat 서버 실행을 위한 CMD 명령어 변경
ENTRYPOINT ["java", "-jar", "app.jar"]
