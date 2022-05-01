# xPre100

**THIS PAGE IS A WIP!!!!**

**Goal:** We seek to define a minimal prose grammar which can be translated to a [categorical framework for knowledge representation (with HEAVY inspiration coming from Ologs)](https://math.mit.edu/~dspivak/informatics/olog.pdf).

## The Challenge

According to [the Merriam-Webster Dictionary](https://www.merriam-webster.com/dictionary/prose), prose is defined as:
> the ordinary language people use in speaking or writing

Google/The Oxford English dictionary goes further and adds `without metrical structure`. Thus, normal prose is inherantly hard to programmatically structure (that is the basis of [NLP - Natural Language Processing](https://en.wikipedia.org/wiki/Natural_language_processing), specifically I am interested in [Part of Speech Tagging](https://en.wikipedia.org/wiki/Part-of-speech_tagging)).

However, that is simply "normal" prose. That is prose written by other people without any forethought about its eventual translation to a structured form. If we define a minimal subset of prose that is translatable to a defined structure, we may then consider how to expand upon the set of prose acceptable and translatable with the eventual goal of "normal-ish" prose such that arbitrary, intentionally constructed, notes can be formulated automatically into our KR framework.

## Phrase Structure

In order to define a minimal subset of prose, we need to investigate the *phrase structure* of typical notes (I use the term phase instead of sentence since sentences are more formally defined, thus we'd be overloading a term, and because most notes are off-hand and more terse they're closer to phases).

**Definition:** A _noun_ is a _phrase_
**Relationship:** A _noun_ [is like | is an example of | consists of | similar to | the same as | different than | etc.] a _noun_
**Action:** _noun_ _action_
**Compoundings:** _noun_ [and | or | with] _noun_

## The Grammar 

Phase 1: Basic Lexing
```
WORDS      := [WORD]
WORD       := OBJECT | ARROW
OBJECT     := ALPHA OBJECT | WHITESPACE
ARROW      := BETA ARROW | WHITESPACE
BETA       := [a-z]
ALPHA      := [A-Z]
WHITESPACE := [\n\t' ']
```

Phase 2: Parsing Tokens
```
RELATIONSHIPS := [RELATIONSHIP]
RELATIONSHIP  := PHRASE ARROW PHRASE
PHRASE        := OBJECT PHRASE | COMPOUNDER PHRASE 
```

**Arrows:**
*[definition]*: a mathematical connection between objects

* `is a`
* `___ of`

**Compounders:**
*[definition]*: a way to compose nouns

* `and`
* `or`

**Objects:**
*[definition]*: the most basic "thing"

* singular
* componded
