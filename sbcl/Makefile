CONTAINER_REGISTRY ?= kubernetes:30005
CONTAINER_IMAGE_TAG ?= alpha
CONTAINER_IMAGE = orihime-sbcl
GIT_URL ?= git://127.0.0.1/
CACHE_BUST ?= 1

help:
	echo "push or build"

push: build
	docker push $(CONTAINER_REGISTRY)/$(CONTAINER_IMAGE):$(CONTAINER_IMAGE_TAG)

build: 
	docker build --network=host \
		--build-arg ORIHIME_GIT_URL=$(GIT_URL) \
		--build-arg ENVIRONMENT=alpha \
		--build-arg CACHE_BUST=$(CACHE_BUST) \
		--tag $(CONTAINER_REGISTRY)/$(CONTAINER_IMAGE):$(CONTAINER_IMAGE_TAG) .
