FROM python:3.12-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PORT=8000 \
    DATA_DIR=/app/data \
    SEED_DEMO_USERS=false

COPY . /app
RUN mkdir -p /app/data \
    && python -m py_compile app.py main.py

EXPOSE 8000

CMD ["python", "main.py"]
