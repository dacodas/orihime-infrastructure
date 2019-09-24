Some configuration done on the Kubernetes nodes

- Added CA to /etc/docker/certs
  
sudo mkdir -p /etc/docker/certs.d/container-registry.dacodastrack.com
sudo ln -sf /etc/kubernetes/pki/ca.crt /etc/docker/certs.d/container-registry.dacodastrack.com/ca.crt

- Created an NFS export at /exports/orihime
  - /exports/orihime/alpha/mysql
  - /exports/orihime/beta/mysql

    Get this working without no_root_squash

    ```
    core@kubernetes-cluster-master-1 ~ $ cat /etc/exports 
    /exports/orihime $IP(insecure,rw,sync,no_subtree_check,no_root_squash)
    /exports/orihime $IP(insecure,rw,sync,no_subtree_check,no_root_squash)
    ```
