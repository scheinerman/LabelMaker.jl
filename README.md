# `LabelMaker`

It is sometimes useful to assign labels to objects as they are created
so that each object gets a unique label. This module provides two 
mechanisms for creating sequential labels: integer labels and string labels. 

## Integer Labels

Use `L = IntLabel()` to create a new integer label maker. Use `L()` 
returns a new label, starting with `0`. Use `L = IntLabel(1)` to start with `1`.
```
julia> using LabelMaker

julia> L = IntLabel();

julia> L()
0

julia> L()
1

julia> L()
2
```

## String Labels

The function `StringLabel` creates a new string label maker. This function takes three arguments:
* `prefix` specifies a `String` that begins each label. Default is `label-`.
* `padding` specifies the number of digits that following the prefix. Default is `6`.
* `start` specifies the numerical value of the first label (must be nonnegative). Default is `0`. 

```
julia> L = StringLabel();

julia> L()
"label-000000"

julia> L()
"label-000001"

julia> L()
"label-000002"
```

## Label Repetition

Integer labels should be unique unless there are more than `2^64` label requests.

For string labels the user should provide enough padding to ensure an adequate supply of labels. 

For example, when the padding is set to `6`, the largest label number is `999999`. Any subsequent label request results in an error. For example:
```
julia> L = StringLabel("short-", 1);

julia> for k=1:12
       println(L())
       end
short-0
short-1
short-2
short-3
short-4
short-5
short-6
short-7
short-8
short-9
ERROR: No more labels possible.
```

## Peek ahead

The function `peek` may be used to preview the next label. It does not advance the label counter. 

## The `next_label!` function

For a label maker `L`, new labels are produced by the syntax `L()`. However, `next_label!(L)` is equivalent (but more verbose).


