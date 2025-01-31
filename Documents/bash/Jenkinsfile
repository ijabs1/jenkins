pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                checkout scm
            }
        }
        
        stage('Set Permissions') {
            steps {
                // Make the script executable
                sh 'chmod +x system_admin.sh'
            }
        }
        
        stage('Run System Admin Script') {
            steps {
                // Run the script and capture output
                sh './system_admin.sh'
            }
        }
    }
    
    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
    }
}