package com.jorgito.qa;

import com.intuit.karate.junit5.Karate;

class ApiTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:features").relativeTo(getClass());
    }
}