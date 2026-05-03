pipeline {
    agent any

    environment {
        KUBECONFIG = '/var/lib/jenkins/.kube/config'
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Xy4c773bbkuf/vle_7.git'
            }
        }

        stage('Update ConfigMap') {
            steps {
                sh '''
                kubectl create configmap web-content \
                --from-file=index.html \
                -o yaml --dry-run=client | kubectl apply -f -
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml
                '''
            }
        }

        stage('Restart') {
            steps {
                sh 'kubectl rollout restart deployment my-app'
            }
        }
    }
}
