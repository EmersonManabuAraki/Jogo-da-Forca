# Jogo-da-Forca(Hangman Game)

## Hangman Game's score criterion

Number of your hits

Word's size

Sequence number you hit

## Hangman Game's score calculation

When you hit the letter two times in sequence, you gain one chance if you haven't more than three chances

The score is calculated by: (1 + Number of hits you had two times in sequence) * ( 1 + Word's size - Number of hit you had) * Your remaining chances
