# Grammar

**Version:** 0.0
**Last Updated:** 05/01/2022
**CompilationEngine:** *SimpleCompilationEngine*

## Overview 

This grammar is the simplest. It's basis is to experiment with linking between relevant pages automatically such that we can naturally replicate the recursive learning process. Consider the following example.

Let's say you have a 1:1 with your manager about improving logging for HaProxy. It might look a bit like this:

1:1_Meeting.note
```
* [HaProxy] is configured to log to [StdOut]
* {HaProxy is a [Load Balancer]}
```

Here, the []'d words link to **definition** notes..

HaProxy.def
```
** all about HaProxy **
```

StdOut.def
```
** all about StdOut **
```

LoadBalancer.def
```
** all about Load Balancer **
```

The {}'d phrases demonstrate relationships. Here we begin a more complex type of linking, where we define an arrow from HaProxy --> LoadBalancer. Here is where we automatically replicate the recursive learning process, defining a tree of concept relationships.

HaProxy --> Load Balancer --> Proxy --> Application

This relationship defines an "instance of" relationship giving us a tree from specific to most general, much like the Object heirarchy in object-oriented programming languages and animal taxonomy. For me, this is how I dive deep into topics. I go up and down this tree (or more generally graph?) of information until I understand the most fundamental concepts.

## Basic Concepts

**Noun:** a concept. Only *defined* concepts are linked. A defined concept is one with a `.def` file. Regular notes are `.note`, `.txt` or `.md`. 

**Aspect:** a connector between two nouns. For this version, the only connector we have is `is a`.

**Relationship:** a bi-directional, class-instance connection, linking the two terms in a formal, mathematical sense.

## Grammar

```
CONCEPTS     := CONCEPT+
CONCEPT      := INTERESTING | UNINTERESTING
INTERESTING  := RELATIONSHIP | PHRASE
RELATIONSHIP := PHRASE ARROW PHRASE
PHRASE       := OBJECT+
OBJECT       := ALPHA OBJECT | WHITESPACE
ARROW        := 'is a'
ALPHA        := [A-Z]
```

*Note:* the use of UNINTERESTING is fairly odd. This just means some non linked entity. Later versions of the grammar will handle these tokens.
