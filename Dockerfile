FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    git \
    mediainfo \
    sqlite3 \
    libgl1 \
    libglib2.0-0 \
    libxml2-dev \
    libxslt1-dev \
    ca-certificates \
    build-essential \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chmod +x start.sh || true

EXPOSE 8080

CMD ["./start.sh"]
