import sys

current_word = None
current_score = 0

for line in sys.stdin:
    word, score = line.strip().split('\t')
    score = int(score)
    
    if word == current_word:
        current_score += score
    else:
        if current_word:
            print(f"{current_word}\t{current_score}")
        current_word = word
        current_score = score

# don't skip last >:(
if current_word:
    print(f"{current_word}\t{current_score}")
