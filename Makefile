FLUENTD =fluentd
TEMPLATES =$(FLUENTD)/templates

HELM_CHART_PREREQS =  $(TEMPLATES)/fluentd-configmap.yaml \
		      $(TEMPLATES)/fluentd-svc.yaml \
		      $(FLUENTD)/values.yaml  \
		      $(FLUENTD)/Chart.yaml

verify: $(HELM_CHART_PREREQS)
	@echo Helm chart is good to be packaged!

package: clean verify
	helm package $(FLUENTD)

install: package
	helm install $(FLUENTD)*.tgz

.PHONY: clean

clean:
	rm -rf *.tgz
