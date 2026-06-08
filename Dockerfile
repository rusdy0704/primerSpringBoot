# --- ETAPA 1: Construcción (Empaquetar el código) ---
FROM maven:3.9.6-eclipse-temurin-21-alpine AS builder
WORKDIR /app
# Copiamos el código fuente y el pom.xml
COPY pom.xml .
COPY src ./src
# Le decimos a Maven que construya el .jar aquí mismo en el servidor
RUN mvn clean package -DskipTests

# --- ETAPA 2: Ejecución (Correr el programa) ---
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
# Copiamos el .jar que se acaba de crear en la Etapa 1
COPY --from=builder /app/target/miPagina-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]