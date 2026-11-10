FROM rust:1.85-bookworm AS builder
WORKDIR /app
COPY backend/Cargo.toml backend/Cargo.lock* ./backend/
COPY backend/migrations ./backend/migrations
COPY backend/src ./backend/src
WORKDIR /app/backend
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /app/backend/target/release/smartlapor-backend /app/smartlapor-backend
COPY --from=builder /app/backend/migrations /app/migrations
RUN mkdir -p /app/uploads
ENV UPLOAD_DIR=/app/uploads
EXPOSE 8080
CMD ["/app/smartlapor-backend"]
