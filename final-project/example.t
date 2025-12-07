print " ";


print "Messing with Switch Statements";
print " ";
//////////////////
print "Basic Structure...";

x = 0;
switch(1) {
    case 1 {
        x = 3;
    }
};
assert x == 3;

switch(-1.5555) {
    case -1.5555{
        x = 4;
    }
};
assert x == 4;

y = "hello";
switch(y) {
    case "hello" {
        x = 3;
    }
};
assert x == 3;
//////////////////
print "Expression Evaluation...";
x = 0;
switch(1+1) {
    case 2{
        x = 3;
    }
};
assert x == 3;

switch(1+1) {
    case 1+2{
        x = 4;
    }
};
assert x == 3;

switch(1+3) {
    case 2+2{
        x = 5;
    }
};
assert x == 5;


//////////////////
print "Default Case...";

x = 0;
switch(4) {
    default {
        x = 6;
    }
};
assert x == 6;

switch(4) {
    case 1 {
        x = 3;
    }
    case 2 {
        x = 4;
    }
    case 3 {
        x = 5;
    }
    default {
        x = 7;
    }
};
assert x == 7;

//////////////////
print "Variable Cases...";

x = 0;
y = 1;
z = 2;
switch(2) {
    case y {
        x = 3;
    }
    case z {
        x = 4;
    }
    default {
        x = 99;
    }
};
assert x == 4;
//////////////////
print "Fall-through...";

x = 0;
y = 1;
z = 2;
switch(1) {
    case y {
        x = 3;
    }
    case z {
        x = 4;
    }
    default {
        x = 99;
    }
};
assert x == 4;
//////////////////
print "Stopping Fall-through (breaks)...";

x = 0;
y = 1;
z = 2;
switch(1) {
    case y {
        x = 3;
        break;
    }
    case z {
        x = 4;
        break;
    }
    default {
        x = 99;
    }
};
assert x == 3;
//////////////////
print " ";

