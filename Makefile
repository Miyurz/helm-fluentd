FLUENTD =fluentd
NAMESPACE=kube-system
TEMPLATES =$(FLUENTD)/templates

HELM_CHART_PREREQS =  $(TEMPLATES)/fluentd-configmap.yaml \
		      $(TEMPLATES)/fluentd-svc.yaml \
		      $(TEMPLATES)/fluentd-svcac.yaml \
		      $(FLUENTD)/values.yaml  \
		      $(FLUENTD)/Chart.yaml

verify: $(HELM_CHART_PREREQS)
	helm lint $(FLUENTD)
	@echo Helm chart is good to be packaged!

package: clean verify
	helm package $(FLUENTD)

install: package
	helm install $(FLUENTD)*.tgz --name $(FLUENTD) --namespace $(NAMESPACE)
	#helm upgrade $(FLUENTD)*.tgz --name $(FLUENTD) 

check_release:
	helm get release $(FLUENTD) || echo Release not found

delete: check_release
	helm delete $(FLUENTD) --purge --namespace $(NAMESPACE)

.PHONY: clean

clean:
	rm -rf *.tgz
