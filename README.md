docker-apachephp5
=================

Dockerfile to deploy a php app living in doc_root behind apache2

To Deploy
================
- Put app in doc_root
- docker run -d $(docker build . | grep Successfully | awk '{print $3}')
- docker ps (find port that was forwarded)
- curl http:/localhost:491xx/index.php
