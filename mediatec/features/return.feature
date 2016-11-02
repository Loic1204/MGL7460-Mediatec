Feature: Rendre un film
  In order to ...
  I want to ...
  So ...

  Scenario: On rend un film
    Given a file named "testbddf.txt" with:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;;
    Inception;Christopher Nolan;2010;loicd;
    """
    When j'execute `mediatec --bddf=testbddf.txt return Inception`

    Then the file "testbddf.txt" should contain exactly:
    """
    Ant-Man;Peyton Reed;2015;;
    Avengers;Joss Whedon;2015;user;
    Inception;Christopher Nolan;2010;;
    """
