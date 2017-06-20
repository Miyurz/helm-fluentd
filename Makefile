FLUENTD =fluentd

HELM_CHART_PREREQS =  fluentd/templates/ fluentd/templates/ fluentd/templates/ fluentd/templates/ fluentd/values.yaml fluentd/Chart.yml

$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

package: clean
	helm package $(FLUENTD)

install: package
	helm install $(FLUENTD)*.tgz

.PHONY: clean

clean:
	rm -rf *.tgz
