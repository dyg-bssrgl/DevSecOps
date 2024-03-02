# Temel imaj olarak Python resmi imajını kullan
FROM python:3.13.0a4-slim

# Çalışma dizinini ayarla
WORKDIR /app

# Gerekli Python modüllerini yükle
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Uygulama dosyalarını kopyala
COPY . .

EXPOSE 8000

# Gunicorn ile uygulamayı başlat
CMD ["gunicorn", "-b", "0.0.0.0:8000", "main:app"]
