import { program } from "commander"
import fs from "fs"
import { parseAccountMap } from "./utils/parse-account-map"

program
    .version("0.0.0")
    .requiredOption(
        "-i, --input <path>",
        "input JSON file location containing a map of account addresses"
    )

program.parse()

const json = JSON.parse(fs.readFileSync(program.opts().input, { encoding: "utf8" }))

if (typeof json !== "object") throw new Error("Invalid JSON")

console.log(JSON.stringify(parseAccountMap(json)))
