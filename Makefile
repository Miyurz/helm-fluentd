FLUENTD =fluentd
TEMPLATES =$(FLUENTD)/templates

HELM_CHART_PREREQS =  $(TEMPLATES)/fluentd-configmap.yaml \
		      $(FLUENTD)/values.yaml  \
		      $(FLUENTD)/Chart.yaml

verify: $(HELM_CHART_PREREQS)
	@echo Helm chart is good to be packages!

package: clean verify
	helm package $(FLUENTD)

install: package
	helm install $(FLUENTD)*.tgz

.PHONY: clean

clean:
	rm -rf *.tgz
