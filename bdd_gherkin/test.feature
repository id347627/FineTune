Feature: Verify that teachers can submit quizzes on the given semester

# Init DB every time you start test the system with known state
Scenario: Init DB with people
    Given Init "default_school_db"
    |name   |password  |type    |class      |
    |Tony   |qwerty    |teacher |history    |
    |Anna   |qwerty    |teacher |algebra    |
    |Anna   |qwerty    |teacher |geometry   |
    |Mike   |qwerty    |teacher |physic     |

# Quizzes can be passed in JSON format and then parsed to store in DB
Scenario Outline: Submitting quizzes
    When <quiz> for <class> on <semester> is submitted by <name> <password> teacher
    Then "Successful submitted" msg appears
Examples:
    |name   |password  |class      |quiz   |semester|
    |Anna   |qwerty    |algebra    |a101   |1       |
    |Anna   |qwerty    |algebra    |a102   |1       |
    |Anna   |qwerty    |algebra    |a103   |1       |
    |Anna   |qwerty    |algebra    |a104   |1       |
    |Anna   |qwerty    |algebra    |a202   |2       |
    |Anna   |qwerty    |algebra    |a203   |2       |
    |Anna   |qwerty    |algebra    |a204   |2       |
    |Anna   |qwerty    |geometry   |g101   |1       |
    |Anna   |qwerty    |geometry   |g102   |1       |
    |Anna   |qwerty    |geometry   |g103   |1       |
    |Anna   |qwerty    |geometry   |g104   |1       |
    |Anna   |qwerty    |geometry   |g201   |2       |
    |Anna   |qwerty    |geometry   |g202   |2       |
    |Anna   |qwerty    |geometry   |g203   |2       |
    |Anna   |qwerty    |geometry   |g204   |2       |
    |Mike   |qwerty    |physic     |ph101  |1       |


Feature: Verify teachers can submit quizzes

Scenario: Init DB with people
    Given Init "default_school_db"
    |name   |password  |type    |class                  |
    |Tony   |qwerty    |teacher |history                |
    |Anna   |qwerty    |teacher |math                   |
    |Mike   |qwerty    |teacher |physic                 |
    |Tonya  |qwerty    |student |physic, math           |
    |Rosa   |qwerty    |student |math                   |
    |Will   |qwerty    |student |physic, math, history  |

Scenario: Init DB with quizzes
    Given Init "default_school_db"
    |name   |password  |type    |class                  |
    |Tony   |qwerty    |teacher |history                |
    |Anna   |qwerty    |teacher |math                   |
    |Mike   |qwerty    |teacher |physic                 |
