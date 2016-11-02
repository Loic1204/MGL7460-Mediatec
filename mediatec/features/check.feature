Feature: Verifier les emprunts en cours
  In order to ...
  I want to ...
  So ...

  Scenario: On verifie les emprunts d'un utilisateur
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    When j'execute `mediatec --bddf=testbddf.txt check loicd`

    Then the stdout should contain exactly:
    """
    Inception

    """
