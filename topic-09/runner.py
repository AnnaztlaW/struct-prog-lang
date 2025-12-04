
import sys

from tokenizer import tokenize

from parser import parse

from evaluator import evaluate

def main():
    environment = {}

    watch_identifier = None

    # Check for command line arguments
    for arg in sys.argv[1:]:
        if arg.startswith("watch="):
            watch_identifier = arg.split("=", 1)[1]

    filename = None
    for arg in sys.argv[1:]:
        if not arg.startswith("watch="):
            filename = arg
            break

    # Hook for tracking watched identifier
    # evaluator will call this whenever an id changes
    def watch_callback(name, value, location):
        if watch_identifier == name:
            line, col = location
            print(f"[watch] {name} = {value}  (line {line}, col {col})")

    environment["__watch_callback__"] = watch_callback


    # File Execution ---
    if filename:
        try:
            with open(filename, 'r') as f:
                source_code = f.read()

            tokens = tokenize(source_code)
            ast = parse(tokens)
            final_value, exit_status = evaluate(ast, environment)

            if exit_status == "exit":
                sys.exit(final_value if isinstance(final_value, int) else 0)

        except Exception as e:
            print(f"Error: {e}")
            sys.exit(1)


if __name__ == "__main__":
    main()
