# arg
print args: count, length and quoted

## Output format:
```
[count]:[length] [...quoted]
```

## Example:

``` sh
$ arg 1 2\' "'3'"
3:6 '1' '2'\''' ''\''3'\'''
```
``` sh
$ arg 1 2\' "'3'" | cat
'1' '2'\''' ''\''3'\'''
```
