pipeline {
    agent { docker { image 'ruby:2.1.9' } }
    stages {
        stage('build') {
            steps {
                sh 'ruby --version'
            }
        }
    }
}
