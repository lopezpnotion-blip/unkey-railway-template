import { createClient } from "@unkey/api";

async function main() {
  const client = createClient({
    rootKey: process.env.UNKEY_ROOT_KEY!,
  });

  console.log("Seeding initial API...");

  await client.apis.create({
    name: "default-api",
  });

  console.log("Seed complete");
}

main();
