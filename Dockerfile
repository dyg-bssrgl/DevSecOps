# Temel imaj olarak Python resmi imajını kullan
FROM python:3.8-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Gerekli Python modüllerini yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . .

# Gunicorn ile uygulamayı başlat
CMD ["gunicorn", "-b", "0.0.0.0:8000", "main:app"]
