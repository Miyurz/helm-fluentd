![EFK](/icons/EFK.jpg)

# Kubernetes-logging
Cluster and Application level logging with Fluentd, Elasticsearch and Kibana.

_NOTE! This repo is a work in progres._

## Overview
This repository contains code to setup logging for the kubernetes clusters. It uses Fluentd, Elasticsearch and Kibana for log-collection, aggregation, log-searching and log-visualization.


## Fluentd
![Fluentd](/icons/Fluentd.jpeg)


## AWS-elasticsearch Service and Kibana
![ECS](/icons/ECS.png)

AWS-Elasticsearch is a popular search and analytics engine for log analytics, full text search, application monitoring etc. This repo uses the AWS-elasticsearch service to create a elasticsearch cluster and kibana dashboard for visualization. It uses the `elasticsearch version-5.3` and `Kibana 5.3`.


## Tasks Involved:
* Create a Helm chart for Fluentd with `fluent.conf` and other configuration files.
* Create a new hosted AWS Elasticsearch service.Need to automate the same with CF teamplate.
* DNS automation in the format `kibana.cluster.name` eg. `kibana.np.saltside.io`
