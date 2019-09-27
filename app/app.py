from __future__ import print_function
import random

buzz = ('continuous testing', 'continuous integration',
    'continuous deployment', 'continuous improvement', 'devops')
adjectives = ('complete', 'modern', 'self-service', 'integrated', 'end-to-end')
adverbs = ('remarkably', 'enormously', 'substantially', 'significantly',
    'seriously')
verbs = ('accelerates', 'improves', 'enhances', 'revamps', 'boosts')

def sample(l, n = 1):
    result = random.sample(l, n)
    if n == 1:
        return result[0]
    return result

def generate():
    terms = sample(buzz, 2)
    phrase = ' '.join([sample(adjectives, 1), terms[0], sample(adverbs, 1),
        sample(verbs, 1), terms[1]])
    return phrase.title()


if __name__ == "__main__":
    print(generate())
