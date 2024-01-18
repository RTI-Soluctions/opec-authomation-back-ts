-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "is_adm" BOOLEAN NOT NULL DEFAULT false
);

-- CreateTable
CREATE TABLE "clients" (
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
    "phone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "agencys" (
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
    "site" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "pis" (
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
    "agencyId" INTEGER NOT NULL,
    "clientId" INTEGER NOT NULL,
    CONSTRAINT "pis_agencyId_fkey" FOREIGN KEY ("agencyId") REFERENCES "agencys" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pis_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "clients" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "users_cpf_key" ON "users"("cpf");

-- CreateIndex
CREATE UNIQUE INDEX "clients_cnpj_cpf_key" ON "clients"("cnpj_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "agencys_cnpj_cpf_key" ON "agencys"("cnpj_cpf");

-- CreateIndex
CREATE UNIQUE INDEX "agencys_email_key" ON "agencys"("email");

-- CreateIndex
CREATE UNIQUE INDEX "pis_PI_key" ON "pis"("PI");
