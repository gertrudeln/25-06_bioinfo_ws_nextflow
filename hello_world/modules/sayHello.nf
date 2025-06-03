#!/usr/bin/env nextflow

process sayHello {
    container 'ubuntu:24.04'

    input:
        val greeting

    output:
        stdout
    
    script:
    """
    echo '$greeting'
    """
}