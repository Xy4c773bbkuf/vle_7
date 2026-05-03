pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/AadityaTiwary1/vle_7_1.git'
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

        stage('Deploy (if not exists)') {
            steps {
                sh '''
                kubectl apply -f deployment.yaml
                kubectl apply -f service.yaml
                '''
            }
        }

        stage('Force Restart') {
            steps {
                sh 'kubectl rollout restart deployment my-app'
            }
        }
    }
}
