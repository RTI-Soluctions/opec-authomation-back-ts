export interface IClientRequest{
    name: string
    corporate_reason: string
    cnpj_cpf: string
    state_registration: string
    municipal_registration: string
    cep: string
    street: string                
    city: string
    state: string
    phone: string
    createdAt: Date
    updatedAt: Date
  }
  
  export interface IClient {
    id: number
    name: string
    corporate_reason: string
    cnpj_cpf: string
    state_registration: string
    municipal_registration: string
    cep: string
    street: string                
    city: string
    state: string
    phone: string
    createdAt: Date
    updatedAt: Date
  }
  

  export interface IClientUpdate {
    name?: string
    corporate_reason?: string
    cnpj_cpf?: string
    state_registration?: string
    municipal_registration?: string
    cep?: string
    street?: string                
    city?: string
    state?: string
    phone?: string
  }