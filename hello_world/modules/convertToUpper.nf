process convertToUpper {

    input:
        val lower

    output:
        stdout

    script:
    """
    echo '$lower' | tr '[a-z]' '[A-Z]'
    """
}
