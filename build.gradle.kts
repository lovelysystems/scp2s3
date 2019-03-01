plugins {
    id("com.lovelysystems.gradle") version ("1.2.0")
}

lovely {
    gitProject()
    dockerProject("lovelysystems/scp2s3")
    with(dockerFiles) {
        from("docker") 
    }
}

