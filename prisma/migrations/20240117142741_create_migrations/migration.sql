/*
  Warnings:

  - Added the required column `updatedAt` to the `pis` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `pis` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `agencys` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `clients` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_pis" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "PI" INTEGER NOT NULL,
    "emission_date" DATETIME NOT NULL,
    "pit_number" TEXT NOT NULL,
    "plano_number" TEXT NOT NULL,
    "spreadsheet" TEXT NOT NULL,
    "product" TEXT NOT NULL,
    "campain" TEXT NOT NULL,
    "padv" TEXT NOT NULL,
    "order_of_service" TEXT NOT NULL,
    "gross_value" REAL NOT NULL,
    "agency_comission" REAL NOT NULL,
    "net_value" REAL NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "agencyId" INTEGER NOT NULL,
    "clientId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "pis_agencyId_fkey" FOREIGN KEY ("agencyId") REFERENCES "agencys" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pis_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pis_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_pis" ("PI", "agencyId", "agency_comission", "campain", "clientId", "emission_date", "gross_value", "id", "net_value", "order_of_service", "padv", "pit_number", "plano_number", "product", "spreadsheet") SELECT "PI", "agencyId", "agency_comission", "campain", "clientId", "emission_date", "gross_value", "id", "net_value", "order_of_service", "padv", "pit_number", "plano_number", "product", "spreadsheet" FROM "pis";
DROP TABLE "pis";
ALTER TABLE "new_pis" RENAME TO "pis";
CREATE UNIQUE INDEX "pis_PI_key" ON "pis"("PI");
CREATE TABLE "new_agencys" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "corporate_reason" TEXT NOT NULL,
    "cnpj_cpf" TEXT NOT NULL,
    "state_registration" TEXT,
    "municipal_registration" TEXT,
    "cep" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "site" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_agencys" ("cep", "city", "cnpj_cpf", "corporate_reason", "email", "id", "municipal_registration", "name", "phone", "site", "state", "state_registration", "street") SELECT "cep", "city", "cnpj_cpf", "corporate_reason", "email", "id", "municipal_registration", "name", "phone", "site", "state", "state_registration", "street" FROM "agencys";
DROP TABLE "agencys";
ALTER TABLE "new_agencys" RENAME TO "agencys";
CREATE UNIQUE INDEX "agencys_cnpj_cpf_key" ON "agencys"("cnpj_cpf");
CREATE UNIQUE INDEX "agencys_email_key" ON "agencys"("email");
CREATE TABLE "new_clients" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "corporate_reason" TEXT NOT NULL,
    "cnpj_cpf" TEXT NOT NULL,
    "state_registration" TEXT,
    "municipal_registration" TEXT,
    "cep" TEXT NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_clients" ("cep", "city", "cnpj_cpf", "corporate_reason", "id", "municipal_registration", "name", "phone", "state", "state_registration", "street") SELECT "cep", "city", "cnpj_cpf", "corporate_reason", "id", "municipal_registration", "name", "phone", "state", "state_registration", "street" FROM "clients";
DROP TABLE "clients";
ALTER TABLE "new_clients" RENAME TO "clients";
CREATE UNIQUE INDEX "clients_cnpj_cpf_key" ON "clients"("cnpj_cpf");
CREATE TABLE "new_users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "is_adm" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_users" ("cpf", "email", "id", "is_adm", "name", "password") SELECT "cpf", "email", "id", "is_adm", "name", "password" FROM "users";
DROP TABLE "users";
ALTER TABLE "new_users" RENAME TO "users";
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");
CREATE UNIQUE INDEX "users_cpf_key" ON "users"("cpf");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
