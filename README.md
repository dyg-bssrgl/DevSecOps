## devSecOps Projesi
createData.py ile verileri otomatik oluşturan kod çalıştırılır. Oluşan csv dosyaları main.py ile API sorgusu aracılığıyla JSON olarak yayınlanır. Ardından nginx ile gunicorn sorguları dışarıya açılır. Gunicorn ile çalışacak uygulama servis haline getirilir.
