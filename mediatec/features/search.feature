Feature: Faire une recherche sur les films
  In order to ...
  I want to ...
  So ...

  Scenario: On recherche tous les films
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    When j'execute `mediatec --bddf=testbddf.txt search`

    Then the stdout should contain exactly:
    """
    TITRE | REALISATEUR | DATE
    Ant-Man|Peyton Reed|2015
    Avengers|Joss Whedon|2015
    Inception|Christopher Nolan|2010

    """

  Scenario: On recherche un film specifique
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    When j'execute `mediatec --bddf=testbddf.txt search --name=Inception`

    Then the stdout should contain exactly:
    """
    TITRE | REALISATEUR | DATE
    Inception|Christopher Nolan|2010

    """

  Scenario: On recheche les films disponibles
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    When j'execute `mediatec --bddf=testbddf.txt search -a`

    Then the stdout should contain exactly:
    """
    TITRE | REALISATEUR | DATE
    Ant-Man|Peyton Reed|2015
    Avengers|Joss Whedon|2015

    """

  Scenario: On recherche un film spécifique disponible
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    When j'execute `mediatec --bddf=testbddf.txt search -a --name=Inception`

    Then the stdout should contain exactly:
    """
    TITRE | REALISATEUR | DATE
    Ant-Man|Peyton Reed|2015

    """
