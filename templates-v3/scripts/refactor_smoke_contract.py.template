#!/usr/bin/env python3
import json
import os
import re
import sys


def _load_text(path):
    with open(path, "r", encoding="utf-8", errors="ignore") as handle:
        return handle.read()


def _assert_file_exists(path, failures):
    if not os.path.exists(path):
        failures.append(f"Missing file: {path}")
        return False
    return True


def _check_functions(file_path, text, functions, failures):
    for name in functions:
        pattern = re.compile(r"\bfunction\s+" + re.escape(name) + r"\s*\(")
        if not pattern.search(text):
            failures.append(f"{file_path}: missing function '{name}'")


def _check_exports(file_path, text, exports, failures):
    if not exports:
        return

    anchor = text.rfind("return {")
    if anchor == -1:
        failures.append(f"{file_path}: no return {{...}} export block found")
        return

    start = text.find("{", anchor)
    if start == -1:
        failures.append(f"{file_path}: malformed return {{...}} export block")
        return

    depth = 0
    end = -1
    for i in range(start, len(text)):
        ch = text[i]
        if ch == "{":
            depth += 1
        elif ch == "}":
            depth -= 1
            if depth == 0:
                end = i
                break

    if end == -1:
        failures.append(f"{file_path}: unterminated return {{...}} export block")
        return

    block = text[start + 1 : end]
    for key in exports:
        key_pattern = re.compile(r"\b" + re.escape(key) + r"\s*:")
        if not key_pattern.search(block):
            failures.append(f"{file_path}: missing export key '{key}'")


def _check_required_strings(file_path, text, required_strings, failures):
    for token in required_strings:
        if token not in text:
            failures.append(f"{file_path}: missing required token '{token}'")


def main():
    if len(sys.argv) != 2:
        print("Usage: python3 scripts/refactor_smoke_contract.py <contract-json>")
        return 2

    contract_path = sys.argv[1]
    if not os.path.exists(contract_path):
        print(f"[contract][FAIL] Contract file not found: {contract_path}")
        return 2

    with open(contract_path, "r", encoding="utf-8") as handle:
        contract = json.load(handle)

    root = os.path.abspath(contract.get("root", "."))
    checks = contract.get("checks", [])
    failures = []

    for check in checks:
        rel_path = check.get("file")
        if not rel_path:
            failures.append("Contract check missing 'file'")
            continue

        file_path = os.path.join(root, rel_path)
        if not _assert_file_exists(file_path, failures):
            continue

        text = _load_text(file_path)
        _check_functions(file_path, text, check.get("functions", []), failures)
        _check_exports(file_path, text, check.get("exports", []), failures)
        _check_required_strings(
            file_path,
            text,
            check.get("required_strings", []),
            failures,
        )

    if failures:
        print("[contract][FAIL] Refactor smoke contract violations:")
        for item in failures:
            print(" - " + item)
        return 1

    print("[contract] OK: Refactor smoke contract passed")
    return 0


if __name__ == "__main__":
    sys.exit(main())
