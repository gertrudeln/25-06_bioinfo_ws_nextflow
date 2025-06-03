
include { sayHello       } from './modules/sayHello.nf'
include { convertToUpper } from './modules/convertToUpper.nf'

workflow {

    greeting_ch = Channel.fromPath(params.greeting)
                         .view{ it -> "Before splitCsv: $it" }
                         .splitCsv()
                         .view{ it -> "After splitCsv: $it" }
                         .map( item -> item[0] )
                         .view{ it -> "After map: $it" }
    // emit a greeting
    sayHello(greeting_ch) | view
    convertToUpper(sayHello.out) | view
}